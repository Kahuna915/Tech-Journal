#secure-ssh.sh
#author Kahuna915
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
echo Create user name?
read $1`
sudo adduser $1

echo Password for user?
read $2
sudo passwd $2






echo Where do you want to SSH to?
read $3

ssh-copy-id -i ~/.ssh/id_rsa.pub $1@$3
sudo -i | $2

sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
systemctl restart sshd.service





