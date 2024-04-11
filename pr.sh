branch_name=$(git branch --show-current)
project_name=$(pwd | grep -o "qapital.*")
# b = "https://github.com/qapital/qapital-investment/pull/new/account-create-updates"
url="https://github.com/qapital/${project_name}/pull/new/${branch_name}"
if [[ -z "${branch_name}" ]]; then
  echo "Not in a git branch"
  exit
fi
if [[ -z "${project_name}" ]]; then
  echo "No Qapital project found to make PR"
  exit
fi

open ${url}
