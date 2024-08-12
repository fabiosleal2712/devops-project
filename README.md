# Projeto de Infraestrutura AWS com Terraform

## Descrição
Este projeto tem como objetivo criar e gerenciar um ambiente completo na AWS utilizando Terraform. O ambiente inclui recursos como VPC, EC2, EKS, RDS, CDN, e ferramentas de CI/CD.

## Pré-requisitos
- Conta AWS
- Terraform instalado
- Git instalado
- Conta no GitHub

## Estrutura do Repositório
```plaintext
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── modules/
│   │   └── (módulos terraform)
├── ci-cd/
│   ├── .github/
│   │   └── workflows/
│   │       └── main.yml
├── docs/
│   ├── README.md
│   ├── implementation_guide.md
│   ├── ci_cd_guide.md
└── video/
    └── video_explicativo.mp4