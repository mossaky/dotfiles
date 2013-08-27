# AWSの環境設定
export AWS_DEFAULT_REGION=ap-northeast-1
export AWS_AUTO_SCALING_URL=https://autoscaling.${AWS_DEFAULT_REGION}.amazonaws.com
export AWS_CREDENTIAL_FILE=
export AWS_CLOUDWATCH_URL=https://monitoring.${AWS_DEFAULT_REGION}.amazonaws.com
export AWS_ELB_URL=https://elasticloadbalancing.${AWS_DEFAULT_REGION}.amazonaws.com
export AWS_API_HOME=/opt/aws
export AWS_CLOUDWATCH_HOME=${AWS_API_HOME}/apitools/mon
export AWS_IAM_HOME=${AWS_API_HOME}/apitools/iam
export AWS_AUTO_SCALING_HOME=${AWS_API_HOME}/apitools/as
export AWS_ELB_HOME=${AWS_API_HOME}/apitools/elb
export AWS_RDS_HOME=${AWS_API_HOME}/apitools/rds
export CS_HOME=${AWS_API_HOME}/apitools/cs

export EC2_HOME=${AWS_API_HOME}/apitools/ec2

export PATH=${PATH}:${AWS_API_HOME}/bin

