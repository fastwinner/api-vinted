<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->id();
            $table->string("titre")->nullable();
            $table->text("description")->nullable();

            $table->string("etat")->nullable();
            $table->float("prix")->nullable();
            $table->foreignId('user_id')->nullable();
            $table->string("marque")->nullable();
            $table->string("categorie")->nullable();
            $table->string("taille")->nullable();

            $table->string("couleur")->nullable();
            $table->integer("nombre_de_vues")->nullable();
            $table->integer("membres_interesses")->nullable();
            $table->date("ajoute_le")->nullable();
            $table->string("mode_de_payement")->nullable();
            $table->string("photo")->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('articles');
    }
};
