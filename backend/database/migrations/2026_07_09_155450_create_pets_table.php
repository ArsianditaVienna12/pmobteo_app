<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pets', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('breed');
            $table->string('age');
            $table->string('gender');
            $table->enum('type', ['Kucing', 'Anjing']);
            $table->enum('status', ['Tersedia', 'Diadopsi'])->default('Tersedia');
            $table->string('trait');
            $table->text('image_url');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pets');
    }
};