#Task Requirements:
# 1) Create a cloudformation stack.
# 2) if stack already exist update the stack.
# 3) make sure to handle all cloudformation validation errors on create and update stack. 


aws cloudformation describe-stacks --stack-name akbar-vpc --output text --region "us-east-2" || error_status=`echo $?`
echo $error_status
if [[  "$error_status"  == 255 ]]; then 
  aws cloudformation create-stack --stack-name akbar-vpc \
    --template-body file:///var/lib/jenkins/workspace/'vpc-stack-(cloudforamtion)'/vpc.yaml \
    --parameters ParameterKey=EnvParam,ParameterValue=test ParameterKey=VpcCIDR,ParameterValue=10.0.0.0/16 \
        ParameterKey=PublicSubnet1CIDR,ParameterValue=10.0.1.0/24 ParameterKey=PrivateSubnet1CIDR,ParameterValue=10.0.3.0/24 --region "us-east-2"
   echo "Creating stack"
else { # try
    aws cloudformation update-stack --stack-name akbar-vpc \
    --template-body file:///var/lib/jenkins/workspace/'vpc-stack-(cloudforamtion)'/vpc.yaml \
    --parameters ParameterKey=EnvParam,ParameterValue=test ParameterKey=PublicSubnet2CIDR,ParameterValue=10.0.2.0/24 \
         ParameterKey=PrivateSubnet2CIDR,ParameterValue=10.0.4.0/24 --region "us-east-2"
} || { # catch
    echo "No Updates to perform" 
}
fi
