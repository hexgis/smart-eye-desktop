/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsmapsettingsutils.h                                       *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/





class QgsMapSettingsUtils
{
%Docstring
 Utilities for map settings.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsmapsettingsutils.h"
%End
  public:

    static bool containsAdvancedEffects( const QgsMapSettings &mapSettings );
%Docstring
 Checks whether any of the layers attached to a map settings object contain advanced effects
 \param mapSettings map settings
 :rtype: bool
%End

    static QString worldFileContent( const QgsMapSettings &mapSettings );
%Docstring
 Creates the content of a world file.
 \param mapSettings map settings
.. note::

   Uses 17 places of precision for all numbers output
 :rtype: str
%End

};

/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsmapsettingsutils.h                                       *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
