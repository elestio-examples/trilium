#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 10s;

#register the local server in the web ui
target=$(docker-compose port trilium 8080)

#Configure new instance
curl http://$target/api/setup/new-document \
  -X 'POST' \
  --compressed



#Setup default password
curl http://$target/set-password \
  -H 'cache-control: max-age=0' \
  -H 'content-type: application/x-www-form-urlencoded' \
  --data-raw 'password1='"$ADMIN_PASSWORD"'&password2='"$ADMIN_PASSWORD"'' \
  --compressed

  