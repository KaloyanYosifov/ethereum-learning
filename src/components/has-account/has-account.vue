<template>
  <navigation />

  <div class="d-flex flex-column">
    <div class="container-fluid">
      <router-view />
    </div>
  </div>
</template>

<script>
/**
 * Internal dependencies.
 */
import Navigation from '@/components/navigation/navigation';

export default {
  name: 'HasAccount',
  components: {
    Navigation,
  },
};
</script>
