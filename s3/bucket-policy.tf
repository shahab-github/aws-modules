resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.example.id
  policy = jsonencode({
    Version = "2012-10-17" 
    Statement = [
      {
        Sid       = "PublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.example.arn,
          "${aws_s3_bucket.example.arn}/*"
        ]
      }
    ]
  })
}
