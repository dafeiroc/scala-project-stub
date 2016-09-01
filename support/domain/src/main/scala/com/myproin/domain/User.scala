package com.myproin.domain

import org.joda.time.DateTime

case class User(
  userId: String,
  accountId: Option[String],
  email: String,
  accountName: String,
  firstName: String,
  lastName: String,
  profileImage: String,
  phone: String,
  address1: Option[String],
  address2: Option[String],
  address3: Option[String],
  address4: Option[String],
  postalCode: Option[String],
  createdAt: DateTime,
  updatedAt: DateTime,
  test: Boolean = false)
