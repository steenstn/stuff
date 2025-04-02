# List the recently visited branches
# Sorted by most recently visited
# 
# Gets the current branch and if currently on a branch,
# saves the branch name to $output_file.
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
else
	# Move the line with the branch to the top of the file
	printf "/${branch}/m0\nwq\n" | ed -s "$output_file" -
fi

