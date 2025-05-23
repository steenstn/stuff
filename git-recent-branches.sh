# Adds the current git branch to a file.
# If it's already in the file move it to top
#
# To keep a running history of most recently visited branches,
# add this to .zshrc:
# preexec() {
#     sh /path-to-script/git-recent-branches.sh
# }
#
# Then for easy access add:
# alias rb='cat /path-to-script/git_recent_branches.txt'
#

output_file=~/git_recent_branches.txt
history_length=8
branch=$(git branch --show-current 2> /dev/null)
if [[ -z "$branch" ]]; then
	exit
fi

if ! grep -qF "${branch}" "$output_file" 2> /dev/null; then
	echo "${branch}" >> "$output_file"
fi

# Move the line with the branch to the top of the file
printf "/${branch}/m0\nwq\n" | ed -s "$output_file" -

# Remove the last line if there are too many entries
if [ $(wc -l < "$output_file") -gt $history_length ]; then
	printf "\$d\nwq\n" | ed -s "$output_file" -
fi
