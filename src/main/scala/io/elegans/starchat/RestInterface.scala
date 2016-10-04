package io.elegans.starchat

/**
  * Created by Angelo Leto <angelo.leto@elegans.io> on 27/06/16.
  */

import scala.concurrent.ExecutionContext

import akka.http.scaladsl.server.Route

import io.elegans.starchat.resources._
import io.elegans.starchat.services._

trait RestInterface extends Resources {
  implicit def executionContext: ExecutionContext

  lazy val kbElasticService = new KnowledgeBaseService
  lazy val dtElasticService = new DecisionTableService

  val routes: Route = knowledgeBaseRoutes ~
    knowledgeBaseSearchRoutes ~ decisionTableRoutes ~ decisionTableSearchRoutes ~
    decisionTableResponseRequestRoutes
}

trait Resources extends KnowledgeBaseResource with DecisionTableResource
