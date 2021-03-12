terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_route53_zone" "zone" {
  name = var.zone_name
}

resource "aws_route53_record" "zone-record" {
  count = var.records_per_zone
  zone_id = aws_route53_zone.zone.zone_id
  name    = format("record%d.%s",count.index,aws_route53_zone.zone.name)
  type    = "A"
  ttl     = "30"
  records = var.record_a_values
}
