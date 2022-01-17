sudo dnf install -y git

chmod 700 ~/.ssh;

git config user.name 'Johannes Qvarford'
email=$(read -p "What is your current email?" | tr "@+" "__")
rsa_path="~/.ssh/id_rsa_$email"
# git config user.email 'jq.email+github@pm.me'

touch "$rsa_path"
ssh-keygen -t rsa -b 2048 -C "$email" -f "$rsa_path"
echo
echo paste the below into <TODO: ssh keys page on github>
echo
cat "${rsa_path}.pub"
echo
read -p "Have you copied the above? "
echo

mv ~/.ssh/id_rsa ~/.ssh/id_rsa.mission
mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.mission.pub


email=jq.email+github@pm.me
rsa_path=$(echo "~/.ssh/id_rsa_$email" | tr "@+" "__")
# git config user.email 'johqva.email+github@pm.me'

ssh-keygen -t rsa -b 2048 -C "$email"
echo
echo paste the below into <TODO: ssh keys page on github>
echo
cat "${rsa_path}.pub"
echo
read -p "Have you copied the above? "
echo

mv ~/.ssh/id_rsa ~/.ssh/id_rsa.nexer
mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.nexer.pub

cat >~/.ssh/config <<EOF
Host home
Hostname github.com
IdentityFile ~/.ssh/id_rsa.nexer
User jq.email+github@pm.me
EOF

chmod 600 ~/.ssh/*

# 