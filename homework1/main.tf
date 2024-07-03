resource "aws_iam_user" "k-pop" {
  name = "jenny"
}

resource "aws_iam_user" "k-pop2" {
  name = "rose"
}


resource "aws_iam_user" "k-pop3" {
  name = "lisa"
}


resource "aws_iam_user" "k-pop4" {
  name = "jisoo"
}


resource "aws_iam_user" "k-pop5" {
  name = "jihyo"
}


resource "aws_iam_user" "k-pop6" {
  name = "sana"
}


resource "aws_iam_user" "k-pop7" {
  name = "momo"
}


resource "aws_iam_user" "k-pop8" {
  name = "dahyun"
}


resource "aws_iam_group" "group1" {
  name = "blackpink" 
}
resource "aws_iam_group" "group2" {
  name = "twice" 
}

resource "aws_iam_group_membership" "team1" {
  name = "blackpink-members"

  users = [
    aws_iam_user.k-pop.name,
    aws_iam_user.k-pop2.name,
    aws_iam_user.k-pop3.name,
    aws_iam_user.k-pop4.name,
  ]

  group = aws_iam_group.group1.name
}
resource "aws_iam_group_membership" "team2" {
  name = "twice-members"

  users = [
    aws_iam_user.k-pop5.name,
    aws_iam_user.k-pop6.name,
    aws_iam_user.k-pop7.name,
    aws_iam_user.k-pop8.name,
  ]

  group = aws_iam_group.group2.name
}

resource "aws_iam_user" "k-pop9" {     
  name = "miyeon"
}
resource "aws_iam_user" "k-pop10" {     
  name = "mina" 
}
# terraform import aws_iam_user.k-pop9 miyeon
# terraform import aws_iam_user.k-pop10 mina


resource "aws_iam_group_membership" "teams" {
  name = "blackpink-members"

  users = [
    aws_iam_user.k-pop9.name
  ]

  group = aws_iam_group.group1.name
}
resource "aws_iam_group_membership" "teams2" {
  name = "twice-members"

  users = [
    aws_iam_user.k-pop10.name
  ]

  group = aws_iam_group.group2.name
}