#! /bin/bash
sudo atp-get update
sudo atp-get install -y apache
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Deployed via terraform</h1>" | sudo tee /var/www/html/index.html