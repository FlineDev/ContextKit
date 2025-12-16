#!/bin/bash

set -e  # Exit on any error

# Color definitions for output formatting
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly MAGENTA='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m' # No Color

# Global variables
readonly CONTEXTKIT_DIR="$HOME/.ContextKit"
readonly GITHUB_REPO="https://github.com/FlineDev/ContextKit.git"
INSTALL_TYPE="install"

###########################################
# Utility Functions
###########################################

# Print colored status messages
print_status() {
   local color=$1
   shift
   echo -e "${color}$*${NC}"
}

print_error() {
   print_status "$RED" "❌ ERROR: $*" >&2
}

print_success() {
   print_status "$GREEN" "✅ $*"
}

print_warning() {
   print_status "$YELLOW" "⚠️ WARNING: $*"
}

print_info() {
   print_status "$CYAN" "ℹ️ $*"
}

print_step() {
   print_status "$BLUE" "🔄 $*"
}

print_header() {
   echo
   print_status "$MAGENTA" "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
   print_status "$WHITE" "                      $*"
   print_status "$MAGENTA" "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
   echo
}

###########################################
# Execution Flow (main)
###########################################

## Step 1: Clone or update ContextKit repository
clone_or_update_repository() {
   print_step "Step 1: Setting up ContextKit repository..."
   
   if [[ -d "$CONTEXTKIT_DIR/.git" ]]; then
      # Existing git repository - update it
      print_info "Existing ContextKit installation detected - updating..."
      cd "$CONTEXTKIT_DIR"
      if ! git pull origin main; then
         print_error "Failed to update ContextKit repository"
         print_info "Repository: $GITHUB_REPO"
         exit 1
      fi
      INSTALL_TYPE="update"
      print_success "ContextKit repository updated successfully"
   elif [[ -d "$CONTEXTKIT_DIR" ]]; then
      # Directory exists but not a git repo - remove and clone fresh
      print_warning "Existing ContextKit directory found (not a git repository)"
      print_info "Removing corrupted installation and cloning fresh..."
      if [[ "$CONTEXTKIT_DIR" == *"ContextKit"* ]]; then
         rm -rf "$CONTEXTKIT_DIR"  # Safe: only removes ContextKit directories
      fi
      if ! git clone --depth 1 --quiet "$GITHUB_REPO" "$CONTEXTKIT_DIR"; then
         print_error "Failed to clone ContextKit repository"
         print_info "Repository: $GITHUB_REPO"
         exit 1
      fi
      print_success "ContextKit repository cloned successfully"
   else
      # Fresh installation
      print_info "Installing ContextKit for the first time..."
      if ! git clone --depth 1 --quiet "$GITHUB_REPO" "$CONTEXTKIT_DIR"; then
         print_error "Failed to clone ContextKit repository"
         print_info "Repository: $GITHUB_REPO"
         exit 1
      fi
      print_success "ContextKit repository cloned successfully"
   fi
   
   print_info "ContextKit repository ready at: $CONTEXTKIT_DIR"
}

## Step 2: Install global ContextKit commands
install_global_commands() {
   print_step "Step 2: Installing global ContextKit commands..."
   
   # Create Claude Code commands directory if needed
   local claude_commands_dir="$HOME/.claude/commands"
   
   if [[ ! -d "$claude_commands_dir" ]]; then
      print_info "Creating Claude Code commands directory..."
      if ! mkdir -p "$claude_commands_dir" 2>/dev/null; then
         print_warning "Cannot create $claude_commands_dir"
         print_info "You may need to run Claude Code first, then re-run this installer"
         return 0
      fi
   fi
   
   # Create ctxk commands directory and copy ONLY proj commands globally
   local commands_dir="$CONTEXTKIT_DIR/Templates/Commands"
   local ctxk_commands_dir="$claude_commands_dir/ctxk"

   if [[ ! -d "$commands_dir/proj" ]]; then
      print_error "Proj commands directory not found: $commands_dir/proj"
      exit 1
   fi

   # Create ctxk directory structure
   if ! mkdir -p "$ctxk_commands_dir"; then
      print_error "Failed to create ctxk commands directory"
      exit 1
   fi

   if ! cp -R "$commands_dir/proj" "$ctxk_commands_dir"/; then
      print_error "Failed to copy proj commands"
      exit 1
   fi
   
   print_success "Global ContextKit project management commands installed"
   print_info "Project commands (/ctxk:proj:*) available in Claude Code globally"
}

## Step 3: Display success message and next steps
display_completion() {
   print_step "Step 3: Installation complete!"

   if [[ "$INSTALL_TYPE" == "update" ]]; then
      print_header "🧠 ContextKit Update Successful!"
   else
      print_header "🧠 ContextKit Installation Successful!"
   fi

   print_success "ContextKit ${INSTALL_TYPE}d successfully!"
   echo
   print_status "$WHITE" "Next steps:"
   print_info "1. Navigate to your project directory"
   print_info "2. Run 'claude' to start Claude Code "
   print_info "3. Run '/ctxk:proj:init' to initialize ContextKit workflow commands in your project"
   echo
   print_status "$GREEN" "🚀 Ready for intelligent development workflows!"
   echo
}

###########################################
# Error Handling and Cleanup
###########################################

cleanup_on_error() {
   print_error "Installation failed - cleaning up..."
   
   # Only remove if we created it in this session
   if [[ -n "$CONTEXTKIT_CREATED" && -d "$CONTEXTKIT_DIR" ]]; then
      print_info "Removing incomplete installation..."
      if [[ "$CONTEXTKIT_DIR" == *"ContextKit"* ]]; then
         rm -rf "$CONTEXTKIT_DIR"  # Safe: only removes ContextKit directories
      fi 2>/dev/null || true
   fi
   
   print_error "Please check the error messages above and try again"
   print_info "For support: https://github.com/FlineDev/ContextKit/issues"
   exit 1
}

# Set trap for cleanup on error
trap cleanup_on_error ERR


###########################################
# Main Execution
###########################################

main() {
   print_header "🧠 ContextKit Global Installation"
   echo
   print_info "Installing ContextKit - Context Engineering System"
   print_info "Repository: https://github.com/FlineDev/ContextKit"
   echo
   
   # Mark if we're creating ContextKit directory (for cleanup)
   if [[ ! -d "$CONTEXTKIT_DIR" ]]; then
      export CONTEXTKIT_CREATED=true
   fi
   
   # Execute installation steps
   clone_or_update_repository
   install_global_commands
   display_completion
   
   # Clear cleanup flag - successful installation
   unset CONTEXTKIT_CREATED
}

# Only execute main if script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]] || [[ "${0}" == "bash" ]] || [[ "${0}" == "sh" ]]; then
   main "$@"
fi