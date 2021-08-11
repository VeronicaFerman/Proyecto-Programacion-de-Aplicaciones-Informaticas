from core.pyba_logic import PybaLogic


class SolicitudLogic(PybaLogic):
    def __init__(self):
        super().__init__()

#Insertar en la tabla de solicitudes
    def insertSolicitud(self,User_name,User_email,Book_name,Book_year,Book_author,message):
        database = self.createDatabaseObj()
        sql = (
            "INSERT INTO `request`(`idrequest`,`User_name`,`User_email`,`Book_name`,`Book_year`,`Book_author`,`message`)"
            + f"VALUES(0,'{User_name}','{User_email}','{Book_name}',{Book_year},'{Book_author}','{message}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows


#Get solicitudes

    def getAllSolicitudes(self):
        database = self.createDatabaseObj()
        sql = (
            "SELECT idrequest,User_name,User_email,Book_name,Book_year,Book_author,message FROM `request`;"
        )
        result = database.executeQuery(sql)
        if len(result) > 0:
            return result
        else:
            return []     


    #Borrar solicitudes
   
    def deleteSolicitudesByBook(self, idrequest):
        database = self.createDatabaseObj()
        sql = (
            "DELETE FROM `request`"
            + f"WHERE  `idrequest` like '{idrequest}';"
        )
        rows = database.executeNonQueryRows(sql)
        return rows