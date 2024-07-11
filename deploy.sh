
arg=$1
echo $arg
source ./$arg.sh
sam deploy -t pipeline.yml \
    --stack-name ${ResourcePrefix}-${Environment}-Backend \
    --region=${REGION} \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM \
    --parameter-overrides \
        Environment=${Environment} \
        BackendRepoName=${BackendRepoName} \
        Region=${REGION} \
        MainGitBranch=${MainGitBranch} \
        StackName=${ResourcePrefix}-${Environment}-resources \
        PipelineArtifactBucket=${ResourcePrefix}-${Environment}-backend-deployments \
        Tags="${Tags}" \
        IsS3BucketExists=${IsS3BucketExists} \
        ResourcePrefix=${ResourcePrefix} \
        SourceCodeProvider=CodeCommit 
