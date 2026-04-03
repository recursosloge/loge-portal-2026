#!/bin/bash

# Script para cargar datos a Firestore - LOGE Portal 2026
# Uso: bash cargar-datos.sh

API_KEY="AIzaSyAddzw3OReVYbhZ3l9VcrG4qXxT8GH7uSY"
PROJECT_ID="loge-portal-2026"
BASE_URL="https://firestore.googleapis.com/v1/projects/$PROJECT_ID/databases/(default)/documents"

echo "🚀 Iniciando carga de datos a Firestore..."
echo ""

# Función para cargar un documento
cargar_documento() {
  local coleccion=$1
  local doc_id=$2
  local json_data=$3

  curl -s -X POST "${BASE_URL}/${coleccion}?key=${API_KEY}" \
    -H "Content-Type: application/json" \
    -d "$json_data" > /dev/null

  echo "✅ ${coleccion}/${doc_id}"
}

# Cargar avisos
echo "📣 Cargando avisos..."
cargar_documento "avisos" "aviso_1" '{"fields":{"id":{"integerValue":"1"},"fecha":{"stringValue":"2026-03-17"},"titulo":{"stringValue":"¡Bienvenidos al año académico 2026!"},"texto":{"stringValue":"Comenzamos el nuevo año de la LOGE. Les recordamos revisar el cronograma de clases en esta plataforma y estar atentos a los avisos ante posibles cambios de día por feriados."},"tipo":{"stringValue":"info"},"year":{"integerValue":"0"},"pinned":{"booleanValue":true},"vencimiento":{"nullValue":null},"autor":{"stringValue":"Dirección LOGE"}}}'

cargar_documento "avisos" "aviso_2" '{"fields":{"id":{"integerValue":"2"},"fecha":{"stringValue":"2026-03-24"},"titulo":{"stringValue":"Cambio de día – Semana 2 (1° año)"},"texto":{"stringValue":"Por el feriado del 24/03, la clase de AF de 1° año pasa al miércoles 25/03."},"tipo":{"stringValue":"cambio"},"year":{"integerValue":"1"},"pinned":{"booleanValue":false},"vencimiento":{"nullValue":null},"autor":{"stringValue":"Coordinación"}}}'

cargar_documento "avisos" "aviso_3" '{"fields":{"id":{"integerValue":"3"},"fecha":{"stringValue":"2026-03-31"},"titulo":{"stringValue":"Cambio de día – Semana 6 (2° año)"},"texto":{"stringValue":"Por el feriado del 2/04, la clase de AFR de 2° año pasa al miércoles 1/04."},"tipo":{"stringValue":"cambio"},"year":{"integerValue":"2"},"pinned":{"booleanValue":false},"vencimiento":{"nullValue":null},"autor":{"stringValue":"Coordinación"}}}'

cargar_documento "avisos" "aviso_4" '{"fields":{"id":{"integerValue":"4"},"fecha":{"stringValue":"2026-04-01"},"titulo":{"stringValue":"Recordatorio: Taller Integración F1"},"texto":{"stringValue":"Se acerca el Taller de Integración F1. Revisen las consignas y coordinen con sus grupos."},"tipo":{"stringValue":"entrega"},"year":{"integerValue":"1"},"pinned":{"booleanValue":true},"vencimiento":{"stringValue":"2026-04-07"},"autor":{"stringValue":"Coordinadores F1"}}}'

cargar_documento "avisos" "aviso_5" '{"fields":{"id":{"integerValue":"5"},"fecha":{"stringValue":"2026-07-01"},"titulo":{"stringValue":"Receso de invierno: 28 jul – 3 ago"},"texto":{"stringValue":"No hay clases durante el receso de invierno de la Universidad Austral."},"tipo":{"stringValue":"info"},"year":{"integerValue":"0"},"pinned":{"booleanValue":false},"vencimiento":{"nullValue":null},"autor":{"stringValue":"Dirección LOGE"}}}'

echo ""
echo "✅ Avisos completados"
echo ""
echo "🎉 ¡Todos los datos han sido cargados a Firestore!"
echo ""
echo "Ahora:"
echo "1. Abre el portal: loge-portal.html"
echo "2. Los datos deberían aparecer automáticamente"
