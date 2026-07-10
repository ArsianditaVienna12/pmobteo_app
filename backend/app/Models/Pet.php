<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pet extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'breed', 'age', 'gender', 'type', 
        'status', 'trait', 'image_url'
    ];

    public function adoptions()
    {
        return $this->hasMany(Adoption::class);
    }

    public function favoritedBy()
    {
        return $this->belongsToMany(User::class, 'favorites');
    }
}