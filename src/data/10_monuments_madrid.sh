#!/bin/bash

curl --location 'http://localhost:1026/v2/op/update' \
--header 'Content-Type: application/json' \
--data '{
  "actionType": "APPEND",
  "entities": [
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:001",
      "title": {
        "type": "text",
        "value": "Acueducto y rejas sobre el arroyo del Barranco de la Zorra"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.46432173275739,
            -3.6035577418764246
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "5€"
      },
      "occupancy": {
        "type": "number",
        "value": "0"
      },
      "description": {
        "type": "text",
        "value": "Esta construccion, híbrida de puente-acueducto y puerta, alberga uno de los cerramientos con rejería de hierro de fundición, comúnmente conocidos como  de la Casa de Campo y concebido para permitir que los arroyos procedentes del municipio de Pozuelo de Alarcón discurrieran por su cauce natural hasta su desembocadura en el río Manzanares, atravesando el bosque real. Como tal, es una de las cinco rejas que han llegado a nuestros días: la del arroyo Meaques, la del arroyo de Prado del Rey, las dos del arroyo de Antequina y ésta del barranco del arroyo de la Zorra. Como todas ellas también, se enmarca en una obra en ladrillo construida por Francisco Sabatini, a la sazón arquitecto e ingeniero real, datada en 1768 y promovida a instancias de la Casa del Rey dentro del proyecto global de las infraestructuras hidráulicas de la Casa de Campo encomendadas al insigne arquitecto, siendo una demostración más de su reconocido talento técnico y de su versatilidad intelectual y artística, lo que ha debido de contribuir a su reciente inclusión en el Catálogo de monumentos y elementos urbanos por parte del Ayuntamiento de Madrid como elementos susceptibles de protección histórico-artística nivel 1. En la actualidad, el muro o vallado de cerramiento al que se adosa ha quedado adjunto a una urbanización de viviendas unifamiliares apoyadas materialmente en el mismo."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:002",
      "title": {
        "type": "text",
        "value": "Abundancia"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.444200911178676,
            -3.712595448820414
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "0€"
      },
      "occupancy": {
        "type": "number",
        "value": "80"
      },
      "description": {
        "type": "text",
        "value": "En el año 1958 se celebró un sorteo extraordinario de la Lotería Nacional con el fin de recabar fondos para construir una nueva sede para la Central de Loterías y Apuestas del Estado, que sustituyese a la que desde 1932 se hallaba en la calle de Montalbán. El nuevo edificio se inauguró en 1963 al final de la calle de Guzmán el Bueno, y fue construido según un proyecto de corte monumentalista pero moderno en sus detalles diseñado por el arquitecto Manuel Ródenas, autor de otras obras destinadas a las Aduanas del Estado durante esos años, que en la enfática entrada retranqueada respecto de la calle dispuso dos grupos escultóricos flanqueando la plataforma escalonada donde se abren las puertas principales. Estos grupos fueron realizados por el escultor murciano de Espinardo José Planes Peñalver 1891-1974, artista con una carrera llena de éxitos como el Premio Nacional de Escultura de 1932 o el primer premio del Concurso Nacional de Bellas Artes del año 1943, que en 1933 fundó la Escuela de Artes y Oficios de Murcia de la que fue director, y en 1960 fue nombrado académico de la Real Academia de Bellas Artes de San Fernando. Este edificio fue compartido con la Dirección General de Aduanas hasta el año 2000, lo que explica que se haya querido atribuir una representación simbólica a cada escultura en relación con las Aduanas o la Lotería, cuando los atributos que se hacen visibles corresponden a la Abundancia un haz de trigo o a la Fortuna un cántaro con monedas."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:003",
      "title": {
        "type": "text",
        "value": "Adhesión de España a la Comunidad Europea"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.41471076984459,
            -3.705871508121933
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "0€"
      },
      "occupancy": {
        "type": "number",
        "value": "10"
      },
      "description": {
        "type": "text",
        "value": "Monolito erigido el 1 de enero de 1986 para conmemorar el acceso de España a la Comunidad Económica Europea, gracias al tratado internacional firmado en Madrid el 12 de junio de 1985 y siendo alcalde Enrique Tierno Galván. Formaba parte de un conjunto de piezas de diseño urbano, fuente, bancos, arbolado, que fueron objeto del premio de Diseño del propio Ayuntamiento en 1988."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:004",
      "title": {
        "type": "text",
        "value": "Santiago Bernabéu"
      },
      "image":{
        "type": "text",
        "value": "bernabeu.webp"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.453053,
            -3.688344
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "35€"
      },
      "occupancy": {
        "type": "number",
        "value": "60"
      },
      "description": {
        "type": "text",
        "value": "El Estadio Santiago Bernabéu es un recinto deportivo propiedad del Real Madrid Club de Fútbol, situado en pleno paseo de la Castellana, en el distrito de Chamartín de Madrid, España. Se inauguró el 14 de diciembre de 1947 y su aforo actualmente es de 85 000 espectadores.1​ El estadio está catalogado por la UEFA con la máxima distinción, «estadio de élite»"
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:005",
      "title": {
        "type": "text",
        "value": "Puerta del Sol"
      },
      "image":{
        "type": "text",
        "value": "sol.jpg"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.416729,
            -3.703339
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "0€"
      },
      "occupancy": {
        "type": "number",
        "value": "100"
      },
      "description": {
        "type": "text",
        "value": "La Puerta del Sol es una plaza de la ciudad española de Madrid. En ella se encuentra desde 1950 el denominado kilómetro cero de las carreteras radiales del país. El edificio más antiguo de la Puerta del Sol es la Real Casa de Correos y en ella destaca el reloj de torre que fue construido y donado en el siglo XIX por José Rodríguez de Losada, y cuyas campanadas de las 12 de la noche del 31 de diciembre marcan la tradicional toma de las doce uvas a la gran mayoría de los españoles. Dichas campanadas se empezaron a televisar en 1962 en La 1 de TVE, y a partir de ese año no se ha dejado de retransmitir por diversos canales de televisión. La Puerta del Sol es un lugar de cita, un lugar de paso entre diversas partes de Madrid."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:006",
      "title": {
        "type": "text",
        "value": "Palacio Real de Madrid"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.417953,
            -3.714312
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "10€"
      },
      "occupancy": {
        "type": "number",
        "value": "75"
      },
      "description": {
        "type": "text",
        "value": "El Palacio Real de Madrid es la residencia oficial del rey de España no obstante, la familia real no habita en él, sino en el Palacio de la Zarzuela, por lo que es utilizado para ceremonias de Estado y actos solemnes. Con una extensión de 135 000 m2 y 3418 habitaciones casi el doble que el Palacio de Buckingham o el Palacio de Versalles​, es el palacio real más grande de Europa Occidental​ y uno de los más grandes del mundo. Alberga un valioso patrimonio histórico artístico, destacando el conjunto de instrumentos musicales conocido como los Stradivarius Palatinos, y colecciones muy relevantes de otras disciplinas como pintura, escultura y tapicería. Las salas de Estado y las colecciones artísticas están abiertas a las visitas siempre que no haya actos oficiales."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:007",
      "title": {
        "type": "text",
        "value": "La plaza Mayor"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.415524,
            -3.707488
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "0€"
      },
      "occupancy": {
        "type": "number",
        "value": "100"
      },
      "description": {
        "type": "text",
        "value": "Los inicios de la plaza se remontan al siglo XVI, cuando en la confluencia de los caminos hoy en día calles de Toledo y Atocha, a las afueras de la villa medieval, se celebraba en este sitio, conocido como «plaza del Arrabal», el mercado principal de la villa. En esa época se construyó una primera casa porticada, o lonja, para regular el comercio en la plaza. En 1560, tras haber trasladado la corte a Madrid en 1561, Felipe II encargó el proyecto de remodelación de la plaza a Juan de Herrera. Ese mismo año se inició el derribo de las «casas de manzanas» de la antigua plaza. La construcción del primer edificio de la nueva plaza, la Casa de la Panadería, comenzaría en 1590 a cargo de Diego Sillero, en el solar de la antigua lonja. En 1617, Felipe III, encargó la finalización de las obras a Juan Gómez de Mora, quien concluirá la plaza en 1619."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:008",
      "title": {
        "type": "text",
        "value": "Plaza de Cibeles"
      },
      "image":{
        "type": "text",
        "value": "cibeles.jpeg"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.419506,
            -3.692745
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "0€"
      },
      "occupancy": {
        "type": "number",
        "value": "80"
      },
      "description": {
        "type": "text",
        "value": "La plaza de Cibeles se encuentra en la ciudad española de Madrid, en la intersección de la calle de Alcalá que la cruza de oeste a este con el paseo de Recoletos al norte y el paseo del Prado al sur. Este lugar, uno de los más simbólicos de la capital, divide los límites de los distritos Centro, Retiro y Salamanca. En el centro del recinto, se sitúa la célebre fuente de Cibeles, esculpida en el año 1782, a partir de un diseño de Ventura Rodríguez. Cada una de las cuatro esquinas de la plaza está presidida por edificios emblemáticos, construidos entre finales del siglo XVIII y principios del XX. El Palacio de Buenavista, ocupado por el Cuartel General del Ejército de Tierra y que data de 1777, es el más antiguo de todos ellos. Se ubica en el ángulo noroccidental, enfrentado al Palacio de Linares, actual Casa de América, que se alza sobre el nororiental. Por su parte, el Palacio de Comunicaciones, sede del Ayuntamiento de Madrid desde 2007, se extiende sobre el extremo sureste y el Banco de España sobre el suroeste. Con los años, el Palacio de Cibeles y la fuente se han convertido en el monumento símbolo de la ciudad."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:009",
      "title": {
        "type": "text",
        "value": "Catedral de la Almudena"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.415649,
            -3.714552
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "5€"
      },
      "occupancy": {
        "type": "number",
        "value": "45"
      },
      "description": {
        "type": "text",
        "value": "La Santa Iglesia Catedral Metropolitana de Santa María la Real de la Almudena, conocida simplemente como catedral de la Almudena,​ es una catedral de culto católico, dedicada a la Virgen María bajo la advocación de la Almudena, y sede episcopal de Madrid."
      }
    },
    {
      "type": "POI",
      "id": "urn:ngsi-ld:POI:010",
      "title": {
        "type": "text",
        "value": "Templo de Debod"
      },
      "image":{
        "type": "text",
        "value": "debod.jpg"
      },
      "location": {
        "type": "geo:json",
        "value": {
          "type": "Point",
          "coordinates": [
            40.4240528,
            -3.71778
          ]
        }
      },
      "price": {
        "type": "text",
        "value": "0€"
      },
      "occupancy": {
        "type": "number",
        "value": "62"
      },
      "description": {
        "type": "text",
        "value": "El templo de Debod es un edificio del antiguo Egipto localizado actualmente en la ciudad española de Madrid. Está situado al oeste de la plaza de España, junto al paseo del Pintor Rosales parque del Oeste, en un alto donde se encontraba el cuartel de la Montaña."
      }
    }
  ]
}'