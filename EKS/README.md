# #EKS

# Directory Structure
```bash
~/EKS
├── k8s
│   ├── app-config.yml
│   ├── deployments
│   ├── launch_kubernetes.sh
│   └── services
└── terraform
    ├── main.tf
    ├── modules
    ├── outputs.tf
    ├── providers.tf
    └── variables.tf
```
- aws eks update-kubeconfig --region eu-central-1 --name k8s-EKS

- aws sts get-caller-identity
