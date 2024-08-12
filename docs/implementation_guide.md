
---

### **2. `implementation_guide.md`**

```markdown
# Guia de Implementação da Infraestrutura AWS com Terraform

## Introdução
Este documento detalha o processo de implementação da infraestrutura AWS utilizando Terraform. Serão abordados todos os recursos configurados, desde a criação da VPC até o deploy do WordPress.

## Estrutura da VPC e Subnets

### 1. Criando a VPC
- A VPC foi configurada com um bloco CIDR de `10.0.0.0/16`.
- Foram criadas subnets públicas e privadas para distribuição dos recursos.

### 2. Configuração de Subnets
- Subnets públicas para instâncias EC2 e o load balancer.
- Subnets privadas para o banco de dados RDS e recursos sensíveis.

### 3. Tabelas de Roteamento e Gateways
- Configuração de uma internet gateway para comunicação com a internet.
- Tabelas de roteamento apropriadas foram associadas às subnets públicas e privadas.

## Implementação de Recursos de Computação

### 1. Instâncias EC2
- Instâncias EC2 foram configuradas nas subnets públicas para servir como servidores de aplicação.

### 2. Cluster EKS
- Um cluster EKS foi provisionado para orquestração de contêineres com Kubernetes.

### 3. Banco de Dados RDS
- Uma instância RDS MySQL foi criada em uma subnet privada para armazenar os dados da aplicação.

## Gestão de Segredos

### 1. AWS Secrets Manager
- As credenciais do banco de dados e outros segredos foram armazenados no AWS Secrets Manager.

## Observabilidade e Escalabilidade

### 1. Monitoramento com CloudWatch
- Alarmes foram configurados para monitorar a utilização de CPU nas instâncias EC2.

### 2. Auto Scaling
- Políticas de auto scaling foram definidas para garantir a escalabilidade automática das instâncias com base na demanda.

---

**Este guia cobre todos os aspectos necessários para implementar a infraestrutura completa descrita.** 🚀
