
function decedentname() {
	$Context.Document.EFormData.Fill()
	if ($Context.Document.EFormData.Count -gt 0)
	{
		foreach ($eformData in $Context.Document.EFormData) {
			if ($eformData.FieldName -eq "DecedentLastName") {
                if ($eformData.FieldValue.length -gt 0) {
                    $LNAME = $eformData.FieldValue + ', '
                }
			}
            if ($eformData.FieldName -eq "DecedentFirstName") {
                if ($eformData.FieldValue.length -gt 0) {
                    $FNAME = $eformData.FieldValue
                }
            }
            if ($eformData.FieldName -eq "DecedentMiddleName") {
                if ($eformData.FieldValue.length -gt 0) {
                    $MNAME =' '+ $eformData.FieldValue
                }
            }
            if ($eformData.FieldName -eq "DecedentSuffix") {
                if ($eformData.FieldValue.length -gt 0) {
                    $DECSUFFIX = ' '+ $eformData.FieldValue
                }
            }
		}
	}
    $Context.File.Field[5] = $LNAME + $FNAME + $MNAME + $DECSUFFIX
    $Context.File.Save()
}
