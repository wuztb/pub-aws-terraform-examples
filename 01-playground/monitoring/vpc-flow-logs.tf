/*
* Get exisitng vpcs, enable flow logs
*/

data "aws_vpcs" "vpcs01" {}

data "aws_vpc" "vpcs01" {
  count = length(data.aws_vpcs.vpcs01.ids)
  id    = tolist(data.aws_vpcs.vpcs01.ids)[count.index]
}

resource "aws_flow_log" "test_flow_log" {
  count = length(data.aws_vpcs.vpcs01.ids)

  # ...
  vpc_id = data.aws_vpc.vpcs01[count.index].id

  # ...
  iam_role_arn    = aws_iam_role.flow-logs-role-01.arn
  log_destination = aws_cloudwatch_log_group.flow-logs-log-group-01.arn
  traffic_type    = "ALL"
}

output "vpcs01" {
  value = data.aws_vpcs.vpcs01.ids
}

resource "aws_cloudwatch_log_group" "flow-logs-log-group-01" {
  name = "flow-logs-log-group-01"
}

resource "aws_iam_role" "flow-logs-role-01" {
  name = "flow-logs-role-01"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "flow-logs-policy-01" {
  name = "flow-logs-policy-01"
  role = aws_iam_role.flow-logs-role-01.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}