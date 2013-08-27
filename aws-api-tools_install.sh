#! /bin/bash
# aws-api-tools_install.sh

AWS_CLI_HOME=/opt/aws
# インストールディレクトリの作成
[ ! -e ${AWS_CLI_HOME} ] && sudo mkdir -p ${AWS_CLI_HOME}/{amitools,apitools,bin}

# APIのアーカイブ保存場所
DL_PATH=${HOME}/tmp/aws-api-tools

function main() {
	for f in $(find ${DL_PATH} -type f); do
		FILE_NAME=${f##*/}
		echo ${FILE_NAME}
		AWS_API_HOME="${AWS_CLI_HOME}/apitools"
		AWS_AMI_HOME="${AWS_CLI_HOME}/amitools"
		case ${FILE_NAME} in
			AutoScaling*)
				echo "AutoScaling"
				sudo unzip -o $f -d ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}" "AutoScaling")
				create_api_link "${LATEST}" "${AWS_API_HOME}/as"
				create_cmd_link "${AWS_API_HOME}/as/bin"
				;;
			CloudWatch*)
				echo "CloudWatch"
				sudo unzip -o $f -d ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}" "CloudWatch*")
				create_api_link "${LATEST}" "${AWS_API_HOME}/mon"
				create_cmd_link "${AWS_API_HOME}/mon/bin"
				;;
			ElasticLoadBalancing*)
				echo "ElasticLoadBalancing*"
				sudo unzip -o $f -d ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}" "ElasticLoadBalancing")
				create_api_link "${LATEST}" "${AWS_API_HOME}/elb"
				create_cmd_link "${AWS_API_HOME}/elb/bin"
				;;
			IAMCli*)
				echo "IAMCli"
				sudo unzip -o $f -d ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}" "IAMCli")
				create_api_link "${LATEST}" "${AWS_API_HOME}/iam"
				create_cmd_link "${AWS_API_HOME}/iam/bin"
				;;
			RDSCli*)
				echo "RDSCli"
				sudo unzip -o $f -d ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}" "RDSCli")
				create_api_link "${LATEST}" "${AWS_API_HOME}/rds"
				create_cmd_link "${AWS_API_HOME}/rds/bin"
				;;
			cloud-search-tools*)
				echo "cloud-search-tools"
				sudo tar zxvf $f -C ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}"  "cloud-search-tools")
				create_api_link "${LATEST}" "${AWS_API_HOME}/cs"
				create_cmd_link "${AWS_API_HOME}/cs/bin"
				;;
			ec2-api-tools*)
				echo "ec2-api-tools"
				sudo unzip -o $f -d ${AWS_API_HOME}
				LATEST=$(latest_api "${AWS_API_HOME}" "ec2-api-tools")
				create_api_link "${LATEST}" "${AWS_API_HOME}/ec2"
				create_cmd_link "${AWS_API_HOME}/ec2/bin"
				;;
			ec2-ami-tools*)
				echo "ec2-ami-tools"
				sudo unzip -o $f -d ${AWS_AMI_HOME}
				LATEST=$(latest_api "${AWS_AMI_HOME}" "ec2-ami-tools")
				create_api_link "${LATEST}" "${AWS_AMI_HOME}/ec2"
				;;
			*)
				echo "no match"
				;;
		esac
	done
	return 0
}

function latest_api() {
	FIND_PATH=$1
	FIND_NAME=$2

	DIR=$(find ${FIND_PATH} -mindepth 1 -maxdepth 1 -type d -name "*${FIND_NAME}*" | \
			sort | \
			head -n1)
	echo "${DIR}"
	return 0
}

function create_api_link() {
	SRC=$1
	TARGET=$2
	
	[ -e ${TARGET} ] && sudo rm ${TARGET}
	sudo ln -s ${SRC} ${TARGET}

	return 0
}

function create_cmd_link() {
	SRC=$1
	
	for cmd in $(find "${SRC}" -type f); do
		[ -e ${AWS_CLI_HOME}/bin/$(basename ${cmd}) ] && sudo rm ${AWS_CLI_HOME}/bin/$(basename ${cmd})
		if expr "${cmd##*/}" : "[^\.]*$" > /dev/null; then
			sudo ln -s ${cmd} ${AWS_CLI_HOME}/bin/
		fi
	done
	return 0
}

main "$@"
exit $?
