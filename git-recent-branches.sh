# Append the current git branch to a file to keep a history of recent branches
#
# For zsh:
# Add this to .zshrc
# preexec() {
#     sh /path-to-script/git-recent-branches.sh
# }
#
# Then cat the file to see recent branches


output_file=~/git_recent_branches.txt
branch=$(git branch --show-current 2> /dev/null)
if [[ -z "$branch" ]]; then
	exit
fi

if ! grep -qF "${branch}" "$output_file" 2> /dev/null; then
	echo "${branch}" >> "$output_file"
fi

