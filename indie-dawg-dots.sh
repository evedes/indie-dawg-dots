#!/usr/bin/env bash

source "./scripts/utils.sh"
source "./scripts/os.sh"
source "./scripts/gitconfig.sh"

install_dotfiles() {
  clear
  log_info "The Indie Dawg Dotfiles - Install Script"
  log_info "----------------------------------------"

  local os=$(detect_os)

  # Create generated directory if it doesn't exist
  if [ ! -d "./generated" ]; then
    log_info "Creating generated directory..."
    mkdir -p "./generated"
  fi

  # GIT
  generate_gitconfig

  # OS SPECIFIC
  case "$os" in
  arch)
    log_info "Running Arch-specific installation..."

    ;;
  macos)
    log_info "Running macOS-specific installation..."
    ;;
  *)
    log_warning "$os"
    log_warning "Running generic installation..."
    ;;
  esac
}

uninstall_dotfiles() {
  clear
  log_info "The Indie Dawg Dotfiles - Uninstall Script"
  log_info "------------------------------------------"

  # GIT
  remove_gitconfig

  # OS SPECIFIC
}

main() {
  if [ "$#" -gt 0 ]; then
    case "$1" in
    "install")
      install_dotfiles
      ;;
    "uninstall")
      uninstall_dotfiles
      ;;
    "--help" | "-h")
      echo "Usage: $0 [option]"
      echo "Options:"
      echo "  install     Install dotfiles into user's home directory"
      echo "  uninstall   Remove dotfiles from user's home directory"
      echo "  --help, -h  Show this help message"
      exit 0
      ;;
    *)
      log_error "Unknown option: $1"
      echo "Use --help to see available options"
      exit 1
      ;;
    esac
  else
    log_error "No option provided"
    echo "Use --help to see available options"
    exit 1
  fi
}

main "$@"
