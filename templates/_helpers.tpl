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
Define secret name created by Secret Store CSI
*/}}
{{- define "secretStoreCSISecretNameEnv" -}}
{{- printf "%s-%s" (include "common.names.fullname" .) "env" -}}
{{- end -}}

{{/*
Define secret name created by Secret Store CSI
*/}}
{{- define "secretStoreCSISecretNameFiles" -}}
{{- printf "%s-%s" (include "common.names.fullname" .) "files" -}}
{{- end -}}

{{/*
Set data PVC.
*/}}
{{- define "pvc" -}}
{{- .Values.persistence.existingClaim | default (include "common.names.fullname" .) -}}
{{- end -}}