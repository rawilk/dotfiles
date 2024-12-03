#!/bin/sh

echo "Installing Patched Fonts..."
echo ""
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

# clean-up a bit
cd ..
rm -rf fonts
