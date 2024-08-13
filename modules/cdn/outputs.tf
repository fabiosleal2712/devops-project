output "cdn_domain_name" {
  description = "O nome do domínio da distribuição CDN"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cdn_hosted_zone_id" {
  description = "ID da zona hospedada do CloudFront"
  value       = aws_cloudfront_distribution.cdn.hosted_zone_id
}
