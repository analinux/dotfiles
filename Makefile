.PHONY: deps save install

define ASCII

.  ───── oz's ─────  .
┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
 │││ │ │ ├┤ ││  ├┤ └─┐
─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘
·  ───── ·  · ─────  ·

endef
export ASCII
configs= \
	.wallpapers \
	.Xresources \
	.gitconfig \
	.zshrc \
	.config/mako/config \
	.config/hypr \
	.config/waybar \
	.config/wofi \
	.config/deadd \
	.config/wezterm \
        .config/btop \
        .config/neofetch \
        .config/spotify-tui

pkgs= \
	hyprland-nvidia-git \
  wl-clipboard \
  polkit-kde-agent \
  nano \
  xdg-desktop-portal-hyprland-git \
  waybar-hyprland-git \
  gdb \
  ninja \
  cmake \
  meson \
  libxcb \
  xcb-proto \
  xcb-util \
  xcb-util-keysyms \
  libxfixes libx11 \
  libxcomposite \
  xorg-xinput \
  libxrender \
  pixman \
  wayland-protocols \
  cairo \
  pango \
  seatd \
  libxkbcommon \
  xcb-util-wm \
  xorg-xwayland \
  libinput \
  libliftoff \
  libdisplay-info \
  cpio \
  wofi \
  wezterm \
  zsh \
  bat \
  exa \
  nodejs \
  yarn \
  rustup \
  slop \
  imagemagick \
  zsh-autocomplete-git \
  zsh-autosuggestions \
  ttf-firacode-nerd \
  mako \
  wf-recorder \
  catppuccin-gtk-theme-mocha \
  catppuccin-cursors-mocha \
	swww 

cargo_pkgs= \
	punfetch

ascii:
	@echo "$$ASCII"

deps: ascii
	@which yay || { echo "yay is not installed"; exit 1; }
	# Install packages
	yay -S --needed --noconfirm ${pkgs}
	# Verify rustup is setup
	@cargo -V || rustup install stable && rustup default stable
	# Install cargo packages
	cargo install ${cargo_pkgs}

install: ascii
	# Installing dotfiles
	cd dots && \cp -rv . $$HOME/

save: ascii
	# Saving dotfiles
	@for path in ${configs}; do to=$$HOME/$$path; \
		if [[ -f "$$to" ]]; then \
			mkdir -p "./dots/$$(dirname $$path)"; \
			\cp -v "$$to" "./dots/$$path"; \
		elif [[ -d "$$to" ]]; then \
			mkdir -p "./dots/$$path"; \
			\cp -rv $$to/* "./dots/$$path/"; \
		fi \
	done

transparent-gtk:
	@echo "Replacing catppuccin colors with transparent variants"
	cd /usr/share/themes/$$GTK_THEME && \
		sudo find . -type f -name "*.css" -exec sed -i 's/#1e1e2e/rgba(30, 30, 46, 0.7)/g' {} + && \
		sudo find . -type f -name "*.css" -exec sed -i 's/#181825/rgba(24, 24, 37, 0.7)/g' {} + && \
		sudo find . -type f -name "*.css" -exec sed -i 's/#11111b/rgba(17, 17, 27, 0.7)/g' {} +
