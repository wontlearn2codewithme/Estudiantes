using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using EstudiantesRepository.Entities;

namespace EstudiantesRepository.Context
{
    public partial class DomainDbContext : DbContext
    {
        public DomainDbContext()
        {
        }

        public DomainDbContext(DbContextOptions<DomainDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TB_ASIGNACION> TB_ASIGNACION { get; set; } = null!;
        public virtual DbSet<TB_CURSO> TB_CURSO { get; set; } = null!;
        public virtual DbSet<TB_DISTRITO> TB_DISTRITO { get; set; } = null!;
        public virtual DbSet<TB_DOCENTE> TB_DOCENTE { get; set; } = null!;
        public virtual DbSet<TB_ESTUDIANTE> TB_ESTUDIANTE { get; set; } = null!;
        public virtual DbSet<TB_MATRICULA> TB_MATRICULA { get; set; } = null!;
        public virtual DbSet<TB_PROFESION> TB_PROFESION { get; set; } = null!;
        public virtual DbSet<TB_PROVINCIA> TB_PROVINCIA { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                throw new Exception("Database connection string not provided");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TB_ASIGNACION>(entity =>
            {
                entity.HasKey(e => e.IdAsignacion);

                entity.Property(e => e.fech_asi).HasColumnType("date");

                entity.HasOne(d => d.IdCursoNavigation)
                    .WithMany(p => p.TB_ASIGNACION)
                    .HasForeignKey(d => d.IdCurso)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_ASIGNACION_TB_CURSO");

                entity.HasOne(d => d.IdDocenteNavigation)
                    .WithMany(p => p.TB_ASIGNACION)
                    .HasForeignKey(d => d.IdDocente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_ASIGNACION_TB_DOCENTE");
            });

            modelBuilder.Entity<TB_CURSO>(entity =>
            {
                entity.HasKey(e => e.IdCurso);

                entity.Property(e => e.cost_cur).HasColumnType("decimal(18, 0)");
            });

            modelBuilder.Entity<TB_DISTRITO>(entity =>
            {
                entity.HasKey(e => e.IdDistrito);

                entity.HasOne(d => d.IdProvinciaNavigation)
                    .WithMany(p => p.TB_DISTRITO)
                    .HasForeignKey(d => d.IdProvincia)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_DISTRITO_TB_PROVINCIA");
            });

            modelBuilder.Entity<TB_DOCENTE>(entity =>
            {
                entity.HasKey(e => e.IdDocente);

                entity.Property(e => e.ntel_doc).HasMaxLength(50);

                entity.HasOne(d => d.IdProfesionNavigation)
                    .WithMany(p => p.TB_DOCENTE)
                    .HasForeignKey(d => d.IdProfesion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_DOCENTE_TB_PROFESION");
            });

            modelBuilder.Entity<TB_ESTUDIANTE>(entity =>
            {
                entity.HasKey(e => e.IdEstudiante);

                entity.Property(e => e.fnac_est).HasColumnType("date");

                entity.HasOne(d => d.IdDistritoNavigation)
                    .WithMany(p => p.TB_ESTUDIANTE)
                    .HasForeignKey(d => d.IdDistrito)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_ESTUDIANTE_TB_DISTRITO");
            });

            modelBuilder.Entity<TB_MATRICULA>(entity =>
            {
                entity.HasKey(e => e.IdMatricula);

                entity.Property(e => e.fech_mat).HasColumnType("date");

                entity.HasOne(d => d.IdCursoNavigation)
                    .WithMany(p => p.TB_MATRICULA)
                    .HasForeignKey(d => d.IdCurso)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_MATRICULA_TB_CURSO");

                entity.HasOne(d => d.IdEstudianteNavigation)
                    .WithMany(p => p.TB_MATRICULA)
                    .HasForeignKey(d => d.IdEstudiante)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TB_MATRICULA_TB_ESTUDIANTE");
            });

            modelBuilder.Entity<TB_PROFESION>(entity =>
            {
                entity.HasKey(e => e.IdProfesion);
            });

            modelBuilder.Entity<TB_PROVINCIA>(entity =>
            {
                entity.HasKey(e => e.IdProvincia);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
