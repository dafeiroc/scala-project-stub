import sbt._


object Dependencies {

  object Versions {
    val akka                    = "2.4.9"
    val aspectj                 = "1.8.6"
    val logback                 = "1.1.3"
    val mysql                   = "5.1.39"
    val slick                   = "3.1.1"
    val play                    = "2.4.1"
    val scalactic               = "2.2.5"
    val typesafeConfig          = "1.3.0"
    val scalaTime                = "2.6.0"
    val cats                     = "0.3.0"


    val scalaTest               = "2.2.5"
    val scalaMock               = "3.2.2"
    val scalaCheck              = "1.12.2"

  }

  val akkaActor               = "com.typesafe.akka"              %%  "akka-actor"                           % Versions.akka
  val akkaHttp                = "com.typesafe.akka"              %%  "akka-http-experimental"               % Versions.akka
  val akkaHttpCore            = "com.typesafe.akka"              %%  "akka-http-core"                       % Versions.akka
  val akkaHttpXml             = "com.typesafe.akka"              %%  "akka-http-xml-experimental"           % Versions.akka
  val akkaSlf4j               = "com.typesafe.akka"              %%  "akka-slf4j"                           % Versions.akka
  val akkaStream              = "com.typesafe.akka"              %%  "akka-stream"                          % Versions.akka
  val logback                 = "ch.qos.logback"                 %   "logback-classic"                      % Versions.logback
  val mysql                   = "mysql"                          %   "mysql-connector-java"                 % Versions.mysql
  val slick                   = "com.typesafe.slick"             %%   "slick"                               % Versions.slick
  val slickCodegen            = "com.typesafe.slick"             %%   "slick-codegen"                       % Versions.slick
  val playJson                = "com.typesafe.play"              %%  "play-json"                            % Versions.play
  val scalactic               = "org.scalactic"                  %%  "scalactic"                            % Versions.scalactic
  val typesafeConfig          = "com.typesafe"                   %   "config"                               % Versions.typesafeConfig
  val scalaTime                = "com.github.nscala-time"         %%  "nscala-time"                          % Versions.scalaTime
  val cats                     = "org.spire-math"                 %%  "cats"                                 % Versions.cats

  val akkaHttpTest       = "com.typesafe.akka"              %%  "akka-http-testkit"                    % Versions.akka
  val akkaTest           = "com.typesafe.akka"              %%  "akka-testkit"                         % Versions.akka
  val scalaCheck         = "org.scalacheck"                 %%  "scalacheck"                           % Versions.scalaCheck
  val scalaMock          = "org.scalamock"                  %%  "scalamock-scalatest-support"          % Versions.scalaMock
  val scalaTest          = "org.scalatest"                  %%  "scalatest"                            % Versions.scalaTest

  def compile    (modules: ModuleID*): Seq[ModuleID] = modules map (_ % "compile")
  def provided   (modules: ModuleID*): Seq[ModuleID] = modules map (_ % "provided")
  def test       (modules: ModuleID*): Seq[ModuleID] = modules map (_ % "test")
  def runtime    (modules: ModuleID*): Seq[ModuleID] = modules map (_ % "runtime")
  def container  (modules: ModuleID*): Seq[ModuleID] = modules map (_ % "container")
  def compiler   (modules: ModuleID*): Seq[ModuleID] = modules map (compilerPlugin(_))

}
