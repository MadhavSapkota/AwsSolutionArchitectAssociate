USEDMEMORY=$(free -m | awk 'NR==2{printf "%.2f\t", $3*100/$2 }')
 
aws cloudwatch put-metric-data --metric-name memory-usage --dimensions Instance=i-0542ea1e32c310c93  --namespace "Custom" --value $USEDMEMORY

### Run crontab - e and add the following (save with :wq):
# */1 * * * * /home/ec2-user/mem.sh

## Install stress
# sudo amazon-linux-extras install epel -y
# sudo yum install stress-ng -y
# stress-ng --vm 5 --vm-bytes 80% --vm-method all --verify -t 60m -v