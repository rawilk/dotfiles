###################################################
# Zero-Downtime Deployment Script
#
# This can be used as an alternative to Envoyer
# for zero-downtime deployments on forge.
# It may not be suitable for all use cases,
# but for basic sites it should suffice.
#
# You should only need to modify:
# - PROJECT_NAME
# - REPO
#
# If you don't plan on using sitemaps,
# you can remove the lines linking them
# from this script.
#
# If you are encrypting your .env.production file,
# be sure to add that to the ENV_ENCRYPTION_KEY
# variable. If not, remove the decryption line
# from this script.
###################################################

cd /home/forge

# No need to re-deploy the same code twice if our GitHub actions
# creates a new commit from formatting our code.
if [[ $FORGE_DEPLOY_MESSAGE =~ "PHP Linting (Pint)" ]]; then
    echo "Code formatting from GitHub Actions, No need to process..."
    exit 1
fi

PROJECT_NAME="example.com"
PROJECT_REPO="git@github.com:rawilk/example.com.git"
ENV_ENCRYPTION_KEY=
RELEASES_KEPT=3
RELEASE=$(date +"%Y-%m-%d-%H-%M-%S")

# Create our master directory for .env and storage if they don't exist.
# This should only need to be done the first time we deploy with this method.
# We will symlink to these in each release to avoid having to copy them each time.
if [ ! -d $PROJECT_NAME"-data" ]
then
  mkdir $PROJECT_NAME"-data"
  mkdir $PROJECT_NAME"-data/public"
  cp $PROJECT_NAME"/.env" $PROJECT_NAME"-data/.env"
  cp -r $PROJECT_NAME"/storage" $PROJECT_NAME"-data/storage"
  cp $PROJECT_NAME"/public/sitemap.xml" $PROJECT_NAME"-data/public/sitemap.xml"
fi

# Create a project-name-releases directory if it does not exist.
if [ ! -d $PROJECT_NAME"-releases" ]
then
  mkdir $PROJECT_NAME"-releases"
fi

# Create our new release.
cd $PROJECT_NAME"-releases"
git clone -b $FORGE_SITE_BRANCH --depth 1 $PROJECT_REPO $RELEASE

# Reload PHP-FPM.
( flock -w 10 9 || exit 1
    echo 'Restarting FPM...'; sudo -S service $FORGE_PHP_FPM reload ) 9>/tmp/fpmlock

cd $RELEASE

# Install dependencies
$FORGE_COMPOSER install --no-interaction --prefer-dist --optimize-autoloader

# Symlink our .env and storage.
ln -sfn "../../"$PROJECT_NAME"-data/.env" .env
rm -rf storage
ln -sfn "../../"$PROJECT_NAME"-data/storage" storage

# Symlink our sitemaps
ln -sfn "../../../"$PROJECT_NAME"-data/public/sitemap.xml" "public/sitemap.xml"

if [ -f artisan ]
then
  # Update .env with encrypted production .env
  if [ ! -z "$ENV_ENCRYPTION_KEY" ]
  then
    $FORGE_PHP artisan env:decrypt --key="$ENV_ENCRYPTION_KEY" --env=production --filename=.env --force
  fi

  $FORGE_PHP artisan migrate --force
  $FORGE_PHP artisan route:cache
  $FORGE_PHP artisan view:cache
  $FORGE_PHP artisan event:cache
  $FORGE_PHP artisan horizon:terminate
  $FORGE_PHP artisan storage:link
  $FORGE_PHP artisan config:cache
fi

# Compile our assets.
npm install
npm run build

# Now that our scripts are compiled, we can safely remove the node directory.
rm -rf node_modules

# Clean up old releases.
cd ..
rm -rf `ls -1 | sort -r | tail -n +$((RELEASES_KEPT+1))`

cd /home/forge

# Remove the project directory if it exists.
if [ -d $PROJECT_NAME ]
then
  rm -rf $PROJECT_NAME
fi

# Re-link our new release.
ln -sfn $PROJECT_NAME"-releases/"$RELEASE $PROJECT_NAME

# Reload PHP-FPM again for good measure...
( flock -w 10 9 || exit 1
    echo 'Restarting FPM...'; sudo -S service $FORGE_PHP_FPM reload ) 9>/tmp/fpmlock

cd $PROJECT_NAME

if [ -f artisan ]
then
  $FORGE_PHP artisan horizon:terminate
  $FORGE_PHP artisan config:cache
fi

echo 'Deployment complete.'