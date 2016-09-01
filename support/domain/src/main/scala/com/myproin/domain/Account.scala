package com.myproin.domain

import org.joda.time.DateTime

case class Account(
  accountId: String,
  email: String,
  password: String,
  loginFailureCount: Int = 0,
  loginLockedAt: DateTime,
  createdAt: DateTime,
  updateAt: DateTime,
  test: Boolean = false)