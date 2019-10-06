<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
	protected $guarded = ['']; //Pour eviter l'erreur lors des //modificarion des champs choisi 
    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
