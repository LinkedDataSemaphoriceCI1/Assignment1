if [[ $1 -eq 0 ]]
then
  msg="Build Succesful"
else
  msg=$(sed ':a;N;$!ba;s/\n/<br\/>/g' err)
fi
sleep 1
curl -H "Authorization: token $TOKEN" -X POST -d "{\"body\": \" $msg \"}" "https://api.github.com/repos/${SEMAPHORE_REPO_SLUG}/issues/${PULL_REQUEST_NUMBER}/comments"
