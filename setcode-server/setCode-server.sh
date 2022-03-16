

echo $( curl -fsSL https://code-server.dev/install.sh | sh ;
systemctl --user enable --now code-server ;
sudo apt install nginx -y;
)
echo $( myIPv4=$(curl ifconfig.me )
cs_path="/etc/nginx/sites-available/code-server.conf";
sudo touch /etc/nginx/sites-available/code-server.conf;
 echo "server { "  | sudo tee -a $cs_path
  echo " listen 80;" | sudo tee -a $cs_path
   echo " listen [::]:80;"  | sudo tee -a  $cs_path
    echo " server_name $myIPv4;" | sudo tee -a $cs_path
     echo " location / { proxy_pass http://127.0.0.1:8080/; " | sudo tee -a $cs_path
      echo " proxy_set_header Upgrade $http_upgrade;" | sudo tee -a $cs_path
       echo " proxy_set_header Connection upgrade;" | sudo tee -a $cs_path
        echo " proxy_set_header Accept-Encoding gzip;" | sudo tee -a $cs_path
	 echo " } }" | sudo tee -a $cs_path

	 sudo ln -s /etc/nginx/sites-available/code-server.conf /etc/nginx/sites-enabled/code-server.conf;
	 sudo nginx -t && sudo systemctl restart nginx;
	 loginctl enable-linger ubuntu ;

	 sudo ufw allow 22;
	 sudo ufw allow in 80;
	 sudo ufw allow out 80;
	 sudo ufw allow in 443;
	 sudo ufw allow out 443;
	 echo "y" | sudo ufw enable ;

	 )
