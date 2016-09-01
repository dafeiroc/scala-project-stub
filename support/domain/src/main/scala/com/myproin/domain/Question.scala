package com.myproin.domain

import org.joda.time.DateTime

case class Question(
  questionId: String,
  userId: String,
  content: Option[String],
  like: Int = 0,
  listen: Int = 0,
  createdAt: DateTime,
  updatedAt: DateTime,
  test: Boolean = false)
