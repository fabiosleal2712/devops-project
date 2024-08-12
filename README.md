# Projeto de Infraestrutura AWS com Terraform

## Descrição
Este projeto tem como objetivo criar e gerenciar um ambiente completo na AWS utilizando Terraform. O ambiente inclui recursos como VPC, EC2, EKS, RDS, CDN, e ferramentas de CI/CD para automação de deploys.

## Pré-requisitos
- Conta AWS
- Terraform instalado
- Git instalado
- Conta no GitHub

## Estrutura do Repositório
```plaintext
├── terraform/
│   ├── main.tf                  # Arquivo principal do Terraform
│   ├── variables.tf             # Definição de variáveis
│   ├── outputs.tf               # Saídas dos recursos
│   ├── modules/
│   │   └── (módulos terraform)  # Módulos reutilizáveis do Terraform
├── ci-cd/
│   ├── .github/
│   │   └── workflows/
│   │       └── main.yml         # Configuração do pipeline CI/CD
├── docs/
│   ├── README.md                # Este arquivo README
│   ├── implementation_guide.md  # Guia detalhado de implementação
│   ├── ci_cd_guide.md           # Guia de configuração do CI/CD
└── video/
    └── video_explicativo.mp4    # Vídeo explicativo da solução
