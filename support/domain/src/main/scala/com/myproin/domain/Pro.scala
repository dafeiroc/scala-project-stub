package com.myproin.domain

import org.joda.time.DateTime

case class Pro(
  proId: String,
  accountId: Option[String],
  email: String,
  accountName: Option[String],
  firstName: String,
  lastName: String,
  profileImage: Option[String],
  phone: String,
  address1: Option[String],
  address2: Option[String],
  address3: Option[String],
  address4: Option[String],
  postalCode: Option[String],
  shortIntroduction: String,
  longIntroduction: String,
  answerCount: Int = 0,
  followerCount: Int = 0,
  price: BigDecimal,
  currency: String,
  createdAt: DateTime,
  updatedAt: DateTime,
  test: Boolean = false)
