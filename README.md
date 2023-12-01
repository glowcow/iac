# IaC
## Basic Commands

| **Command**  | **Meaning** |
| ------------- |:-------------:|
| `terraform init` | initialization and installation of modules |
| `terraform validate` | check config |
| `terraform plan` | view what will be created |
| `terraform apply` | apply this infrastructure |
| `terraform destroy` | destroy infrastructure |

## CI/CD

To create a new infrastructure:

**CI/CD > Run pipeline**

### For run only Terraform, enter one mandatory variable:

* **TF** - This is terraform project name same as subdirectory under Terraform (e.g. *aws_linux*).

| **Terraform Projects**  | **Description** |
| ------------- |:-------------:|
| `aws_chr` | AWS MikroTik Cloud Hosted Router |
| `aws_k8s_sm` | AWS infrastructure for setup self managed kubernetes cluster |
| `aws_k8s_rke` | AWS infrastructure for setup self managed RKE2 kubernetes cluster |
| `aws_linux` | Basic AWS EC2 for tests |
| `do_chr` | Digital Ocean MikroTik Cloud Hosted Router |
| `do_k8s` | Digital Ocean managed kuberntes cluster |
| `do_linux` | Basic Digital Ocean droplet for tests |
| `openstack_linux` | Basic openstack VM for tests |

### For run Terraform and Ansible, enter three mandatory variable:

* **TF** - This is terraform project name same as subdirectory under Terraform (e.g. *aws_k8s_sm*).
* **ANS** - This is ansible playbook name same as subdirectory under Ansible (e.g. *k8s_sm*).
* **TAGS** - Ansible playbook tags (e.g. *cluster-setup*).

| **Ansible Playbook**  | **Description** | **Available Tags** |
| ------------- |:-------------:|:-------------:|
| `k8s_sm` | Setup self managed kubernetes cluster | *cluster-setup, master-restore, node-add, node-prepare* |
| `k8s_rke` | Setup self managed kubernetes cluster | *all, cluster-setup, node-prepare, post-tasks* |
| `linux` | Various Linux packages and tools | *docker, gitlab-runner, npm* |
