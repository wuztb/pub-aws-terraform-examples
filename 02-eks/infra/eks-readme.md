https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks
https://github.com/hashicorp/learn-terraform-provision-eks-cluster

https://developer.hashicorp.com/terraform/tutorials/kubernetes/kubernetes-provider
https://github.com/hashicorp/learn-terraform-deploy-nginx-kubernetes-provider/blob/eks/kubernetes.tf

Current thinking is
1) Launch cloud guru sandbox.
2) Launch manually cloud9 environment, attach admin instance role.
3) Install required apps (refer to setup-cloud9.sh).
4) Init terraform and nginx

Challenges:
1) Unfortinately automated creation of cloud9 env not fully supported yet.
2) But if directory structure not needed probabably AWS CloudShell or a custom instance with cli is sufficient.

Workarounds:
1) Assign instance admin role to cloud9 and deactivate temp credentials.
2) Make sure the AWS Cli v2 is installed when facing: getting credentials: decoding stdout: no kind "ExecCredential" is registered for version "client.authentication.k8s.io/v1alpha1"
3) Deploy the kubernetes dashboard: https://www.eksworkshop.com/beginner/040_dashboard/dashboard/. Check in Chrome if you have Block third-party cookies in Incognito.