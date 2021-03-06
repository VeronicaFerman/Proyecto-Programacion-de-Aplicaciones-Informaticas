from flask import render_template, redirect, request, session
import requests
from logic.request_logic import RequestLogic
from logic.solicitudes_logic import SolicitudLogic



class RequestRoutes:
    @staticmethod
    def configure_routes(app):
        @app.route("/request", methods=["GET", "POST"])
        def createReq():
            if session["userType"] == "cliente":
                ReqLogic = RequestLogic
                if request.method == "GET":
                    allRequests = ReqLogic()
                    return render_template("request.html")
                elif request.method == "POST":
                    logic = RequestLogic()
                    selectedName = request.form["name"]
                    selectedEmail = request.form["email"]
                    selectedBook = request.form["book"]
                    selectedYear = request.form["year"]
                    selectedAuthor = request.form["author"]
                    selectedMessage = request.form["message"]
                    rows = logic.insertRequest(selectedName,selectedEmail,selectedBook,selectedYear,selectedAuthor,selectedMessage)
                    return render_template("request.html")
    
        @app.route("/requestView", methods=["GET"])
        def requestView():
            ReqLogic = SolicitudLogic()
            if request.method == "GET":
                allRequests = ReqLogic.getAllSolicitudes()
                return render_template("manejosolicitudes.html", allRequests=allRequests)

        @app.route("/requestView/delete/<int:id>", methods=["GET"])
        def deleteSoli(id):
            ReqLogic = SolicitudLogic()
            id = id
            if request.method == "GET":
                rows = ReqLogic.deleteSolicitudesById(id)
                return redirect("/requestView")