merge = (targetObject, mutableObjects...) ->
  for sourceObject in mutableObjects
    for key of sourceObject
      if sourceObject.hasOwnProperty key
        targetObject[key] = sourceObject[key]
  targetObject


module.exports = merge
