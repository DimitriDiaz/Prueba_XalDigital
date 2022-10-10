import requests

def conectar_a_enlace(url):
    conexion = requests.get(url)

    return conexion



def obtener_numero_de_respuestas(datos):
    numero_respuestas = len(datos.get("items"))

    return numero_respuestas



def obtener_respuesta_con_mayor_numero_de_owners(datos):
    respuestas = datos.get("items")
    respuesta_con_mayor_owner = {}
    for respuesta in respuestas:

        if not respuesta_con_mayor_owner:
            respuesta_con_mayor_owner = respuesta

        owner = respuesta.get("owner")
        reputacion = owner.get("reputation")

        if reputacion > respuesta_con_mayor_owner.get("owner").get("reputation"):
            respuesta_con_mayor_owner = respuesta

    return respuesta_con_mayor_owner



def obtener_respuestas_con_menor_numero_de_vistas(datos):
    respuestas = datos.get("items")
    respuesta_con_menor_numero_de_vistas = {}
    for respuesta in respuestas:
        numero_de_vistas = respuesta.get("view_count")

        if not respuesta_con_menor_numero_de_vistas:
            respuesta_con_menor_numero_de_vistas = respuesta

        if numero_de_vistas < respuesta_con_menor_numero_de_vistas.get("view_count"):
            respuesta_con_menor_numero_de_vistas = respuesta

    return respuesta_con_menor_numero_de_vistas



def obtener_respuesta_mas_vieja_y_mas_actual(datos):
    respuestas = datos.get("items")
    respuestas_en_orden = sorted(respuestas, key=lambda elemento_de_lista: elemento_de_lista.get("creation_date"))
    respuesta_mas_antigua = respuestas_en_orden[0]
    respuesta_mas_reciente = respuestas_en_orden[-1]
   
    return respuesta_mas_antigua, respuesta_mas_reciente
        


if __name__ == "__main__":
    url_datos = 'https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow'

    conexion = conectar_a_enlace(url_datos)

    datos = conexion.json()

    numero_respuestas = obtener_numero_de_respuestas(datos)

    respuesta_con_mayor_owner = obtener_respuesta_con_mayor_numero_de_owners(datos)

    respuestas_con_menor_numero_de_vistas = obtener_respuestas_con_menor_numero_de_vistas(datos)

    respuesta_mas_antigua, respuesta_mas_reciente = obtener_respuesta_mas_vieja_y_mas_actual(datos)

    print("2. El numero de respuestas es:", numero_respuestas)

    print("3. La Respuesta con mayor owner es:", respuesta_con_mayor_owner)

    print("4. La respuesta con menor numero de visitas es:", respuestas_con_menor_numero_de_vistas)

    print("5. La respuesta con mas antigua es", respuesta_mas_antigua)

    print("5. La respuesta con mas reciente es", respuesta_mas_reciente)