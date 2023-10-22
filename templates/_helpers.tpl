{{/*
Create the name of the service account to use
*/}}
{{- define "serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Set data PVC.
*/}}
{{- define "pvc" -}}
{{- .Values.persistence.existingClaim | default (include "common.names.fullname" .) -}}
{{- end -}}

{{/*
Return true if enironment variables from secrets store CSI provided
*/}}
{{- define "secretsStoreCsiEnvEnabled" -}}
{{- if .Values.secretsStoreCsi.enabled -}}
    {{- if .Values.secretsStoreCsi.env }}
        {{- true -}}
    {{- end -}}
{{- end -}}
{{- end -}}

