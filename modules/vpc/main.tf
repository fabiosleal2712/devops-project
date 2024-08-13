# Cria a VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge({
    Name = "${var.project_name}-vpc"
  }, var.tags)
}

# Cria o Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = "${var.project_name}-igw"
  }, var.tags)
}

# Cria a tabela de rotas públicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge({
    Name = "${var.project_name}-public-rt"
  }, var.tags)
}

# Associações de sub-redes públicas
resource "aws_route_table_association" "public_subnets" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Cria sub-redes públicas
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets_cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)

  tags = merge({
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  }, var.tags)
}

# Cria sub-redes privadas
resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidr[count.index]
  availability_zone = element(var.availability_zones, count.index)

  tags = merge({
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  }, var.tags)
}

# Cria o NAT Gateway em cada sub-rede pública
resource "aws_eip" "nat" {
  count      = length(var.public_subnets_cidr)
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = merge({
    Name = "${var.project_name}-nat-eip-${count.index + 1}"
  }, var.tags)
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnets_cidr)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge({
    Name = "${var.project_name}-nat-gateway-${count.index + 1}"
  }, var.tags)
}

# Cria a tabela de rotas privadas
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = "${var.project_name}-private-rt"
  }, var.tags)
}

# Adiciona rotas para o NAT Gateway nas sub-redes privadas
resource "aws_route" "private_nat_gateway" {
  count                   = length(var.private_subnets_cidr)
  route_table_id          = aws_route_table.private.id
  destination_cidr_block  = "0.0.0.0/0"
  nat_gateway_id          = element(aws_nat_gateway.nat.*.id, count.index)
}

# Associações de sub-redes privadas
resource "aws_route_table_association" "private_subnets" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
