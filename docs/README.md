# DevOps Project - AWS Terraform Infrastructure

Este projeto configura uma infraestrutura completa na AWS usando Terraform, incluindo VPC, EC2, EKS, RDS, Security Groups, CDN, e Secrets Manager. Ele também implanta uma aplicação WordPress em um cluster Kubernetes (EKS).

## Estrutura do Projeto

- **terraform/**: Contém a configuração principal do Terraform e módulos reutilizáveis.
- **ci-cd/**: Contém a configuração do CI/CD usando GitHub Actions.
- **docs/**: Contém a documentação do projeto, guias de implementação e CI/CD.
- **video/**: Contém o vídeo explicativo da solução.

## Pré-requisitos

- Conta AWS com permissões adequadas.
- Chave SSH para acessar as instâncias EC2.
- Terraform instalado na máquina local.
- AWS CLI configurado.

## Como Usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/yourusername/devops-project.git
   cd devops-project
